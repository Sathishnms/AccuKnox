FRONTEND_URL=http://frontend-service:8080
BACKEND_URL=http://backend-service:3000

BACKEND_RESPONSE=$(curl -s $http://backend-service:3000/api/message)

EXPECTED_MESSAGE="Backend Deployment Successfull"

if [[ "$BACKEND_RESPONSE" == *"$EXPECTED_MESSAGE"* ]]; then
    echo "Backend test passed!"
else
    echo "Backend test failed!"
    exit 1
fi

FRONTEND_RESPONSE=$(curl -s $http://frontend-service:8080)

if [[ "$FRONTEND_RESPONSE" == *"$EXPECTED_MESSAGE"* ]]; then
    echo "Frontend test passed!"
else
    echo "Frontend test failed!"
    exit 1
fi

echo "Integration tests completed successfully!"


